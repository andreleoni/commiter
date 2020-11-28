first_arg = ARGV[0].downcase

if first_arg == "help"
  helpmsg = %{
    Usage

    ruby commiter.rb PROJECT INTENTION "MESSAGE"

    Permitted intentions
    -b --Bug fix (bugfix)
    -s --Start project
    -f --Finish project
    -d --Documentation
    -c --Work in progress
    -r --Code review suggestion changes
    -p --Performance related changes
    -m --Maintenance changes: linter, config updates, etc.
    -rem --Maintenance changes: linter, config updates, etc.
  }

  puts helpmsg
end

second_arg = ARGV[1].downcase
third_arg = ARGV[2..]

templatemsg = ""

case second_arg
when "-b"
  templatemsg += ":bug:	bugfix(#{first_arg})"
when "-s"
  templatemsg += ":tada: start(#{first_arg})"
when "-f"
  templatemsg += ":package: finish(#{first_arg}"
when "-c"
  templatemsg += ":construction: wip(#{first_arg})"
when "-d"
  templatemsg += ":pencil: doc(#{first_arg})"
when "-p"
  templatemsg += ":racehorse: performance(#{first_arg})"
when "-m"
  templatemsg += ":wrench: maintenance(#{first_arg})"
when "-rem"
  templatemsg += ":fire: codingremoval(#{first_arg})"
default
  raise "wrong args"
end

templatemsg += " #{third_arg.join(" ")}"

puts `git commit -m "#{templatemsg}"`
