# the chinese blog is better
# http://blog.csdn.net/zhaoyangjian724/article/details/39996405

# print exec("lfefe");
# print system("ls");

system "ls";
exec "date";  

print "---------------------------\n Won't execute system command\n";
exec "date";  
system "ls";
