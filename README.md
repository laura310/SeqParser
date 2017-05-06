Dev. Environment: macOS Sierra Version 10.12.3

# Libraries & Tools
plantuml

Eclipse AspectJ plug-in enabled

# How to run SeqParser.jar file. 

1, download SeqParser.jar
https://github.com/laura310/SeqParser

[2, nothing to do for test case, it's already put in src/test package.]

3, run the JAR file to generate sequence diagram [ONE parameters needed].
(1) in command line, go to the directory where SeqParser.jar is downloaded.

(2) type in command:
$java -jar SeqParser.jar [path_to_where_graph_is_created]

Example command:
$java -jar SeqParser.jar /Users/laurazhou/Desktop/graph.png

in above example, "/Users/laurazhou/Desktop/new-test-case/test1.png" is the path where the class diagram will be generated, and the ending "graph.png" is the graph name.

