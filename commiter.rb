first_arg = ARGV[0].downcase

if first_arg == "help" && ARGV[1] == nil
  helpmsg = %{
    Usage

    CTX=test ruby commiter.rb INTENTION FULL MESSAGE

    Permitted intentions
    -b --Bug fix (bugfix)
    -s --Start project
    -f --Finish project
    -d --Documentation or anyone comment on code only
    -w --Work in progress
    -r --Code review suggestion changes
    -p --Performance related changes
    -m --Maintenance changes: linter, config updates, etc.
    -rem --Removing code
  }

  puts helpmsg

  return
end

commit_msg = ARGV[1..]

current_context = ENV["CTX"] || ENV["GLOBAL_COMMIT_CTX"] || "default"

if current_context.length > 10
  puts "The lenth of context should not be greather than 10."
end

templatemsg = ""

case first_arg
when "-b"
  templatemsg += ":bug:	bugfix(#{current_context})"
when "-s"
  templatemsg += ":tada: start(#{current_context})"
when "-f"
  templatemsg += ":package: finish(#{current_context})"
when "-w"
  templatemsg += ":construction: wip(#{current_context})"
when "-d"
  templatemsg += ":books: doc(#{current_context})"
when "-p"
  templatemsg += ":racehorse: performance(#{current_context})"
when "-m"
  templatemsg += ":wrench: maintenance(#{current_context})"
when "-rem"
  templatemsg += ":fire: codingremoval(#{current_context})"
when "-r"
  templatemsg += ":pencil: codereview(#{current_context})"
else
  raise "wrong args"
end

templatemsg += " #{commit_msg.join(" ")}"

puts `git commit -m "#{templatemsg}"`
