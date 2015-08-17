require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/btcruby'
require_relative '../lib/btcruby/extensions'

# So every test can access classes directly without prefixing them with BTC::
include BTC

# Script helper used by transaction_spec and script_interpreter_spec
FLAGS_MAP = {
    "" =>                           ScriptFlags::SCRIPT_VERIFY_NONE,
    "NONE" =>                       ScriptFlags::SCRIPT_VERIFY_NONE,
    "P2SH" =>                       ScriptFlags::SCRIPT_VERIFY_P2SH,
    "STRICTENC" =>                  ScriptFlags::SCRIPT_VERIFY_STRICTENC,
    "DERSIG" =>                     ScriptFlags::SCRIPT_VERIFY_DERSIG,
    "LOW_S" =>                      ScriptFlags::SCRIPT_VERIFY_LOW_S,
    "NULLDUMMY" =>                  ScriptFlags::SCRIPT_VERIFY_NULLDUMMY,
    "SIGPUSHONLY" =>                ScriptFlags::SCRIPT_VERIFY_SIGPUSHONLY,
    "MINIMALDATA" =>                ScriptFlags::SCRIPT_VERIFY_MINIMALDATA,
    "DISCOURAGE_UPGRADABLE_NOPS" => ScriptFlags::SCRIPT_VERIFY_DISCOURAGE_UPGRADABLE_NOPS,
    "CLEANSTACK" =>                 ScriptFlags::SCRIPT_VERIFY_CLEANSTACK,
}

def parse_script(json_script, expected_result = true)
  # Note: individual 0xXX bytes may not be individually valid pushdatas, but will be valid when composed together.
  # Since Script parses binary string right away, we need to compose all distinct bytes in a single hex string.
  orig_string = json_script
  json_script = json_script.dup
  oldsize = json_script.size + 1
  while json_script.size != oldsize
    oldsize = json_script.size
    json_script.gsub!(/0x([0-9a-fA-F]+)\s+0x/, "0x\\1")
  end
  json_script.split(" ").inject(Script.new) do |parsed_script, x|
    if x.size == 0
      # Empty string, ignore.
      parsed_script
    elsif x =~ /^-?\d+$/
      # Number
      n = x.to_i
      if (n == -1) || (n >= 1 and n <= 16)
        parsed_script << Opcode.opcode_for_small_integer(n)
      else
        parsed_script << ScriptNumber.new(integer: n).data
      end
    elsif x[0,2] == "0x"
      # Raw hex data, inserted NOT pushed onto stack:
      data = BTC.from_hex(x[2..-1])
      Script.new(data: parsed_script.data + data)
    elsif x =~ /^'.*'$/
      # Single-quoted string, pushed as data.
      parsed_script << x[1..-2]
    else
      # opcode, e.g. OP_ADD or ADD:
      opcode = Opcode.opcode_for_name("OP_" + x)
      parsed_script << opcode
    end
  end
rescue => e
  if expected_result
    # puts "json_script = #{orig_string.inspect}"
    # puts "json_script = #{json_script.inspect}"
    # puts "EXCEPTION: #{e}"
  end
  return nil
end

def parse_flags(string)
  string.split(",").inject(0) do |flags, x|
    f = FLAGS_MAP[x] or raise RuntimeError, "unrecognized script flag: #{x.inspect}"
    flags | f
  end
end

def build_crediting_transaction(scriptPubKey)
  txCredit = Transaction.new;
  txCredit.version = 1;
  txCredit.lock_time = 0;
  txCredit.add_input(TransactionInput.new(
    previous_hash: nil,
    coinbase_data: (Script.new << ScriptNumber.new(integer:0) << ScriptNumber.new(integer:0)).data
  ))
  txCredit.add_output(TransactionOutput.new(
    script: scriptPubKey,
    value: 0
  ))
  txCredit
end

def build_spending_transaction(scriptSig, txCredit)
  txSpend = Transaction.new
  txSpend.version = 1;
  txSpend.lock_time = 0;
  txSpend.add_input(TransactionInput.new(
    previous_hash: txCredit.transaction_hash,
    previous_index: 0,
    signature_script: scriptSig
  ))
  txSpend.add_output(TransactionOutput.new(
    script: Script.new,
    value: 0
  ))
  txSpend
end

# ctx = build_crediting_transaction(Script.new)
# stx = build_spending_transaction(Script.new, build_crediting_transaction(Script.new))
# 
# puts "crediting tx: #{ctx.transaction_id}" # 7f33a2f5ace097f071010d5105e7fd01f22c83d8d5daa741a41f2a630a2af23b
# puts "spending tx:  #{stx.transaction_id}" # add55eb99bb1f653ab822ea4177cb0f9673bcc5c2c4c729894ab0c626c8fa1e1
# 
# puts "crediting tx: #{ctx.data.to_hex}"
# puts "spending tx:  #{stx.data.to_hex}"
# From Bitcoin Core:
# ctxdummy: 01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff020000ffffffff0100000000000000000000000000; 
# ID = 7f33a2f5ace097f071010d5105e7fd01f22c83d8d5daa741a41f2a630a2af23b
# stxdummy: 01000000013bf22a0a632a1fa441a7dad5d8832cf201fde705510d0171f097e0acf5a2337f0000000000ffffffff0100000000000000000000000000; 
# ID = add55eb99bb1f653ab822ea4177cb0f9673bcc5c2c4c729894ab0c626c8fa1e1


