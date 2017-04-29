package diagram;

import org.aspectj.lang.reflect.MethodSignature;

public aspect MethodTracer {

    pointcut pt():
    	within(test..*) && (call(public * test ..*(..)));

    before(): pt(){
        String methodName = thisJoinPointStaticPart.getSignature().getName();
        System.out.println("***** thisJoinPointStaticPart: " + thisJoinPointStaticPart);
//        System.out.println("***** methodName: " + methodName);
        
        String verboseCallee = thisJoinPoint.getTarget().getClass().getName();
        String callee = verboseCallee.substring(verboseCallee.lastIndexOf(".") + 1);
//        System.out.println("***** callee: " + callee);
        
        Object[]  args = thisJoinPoint.getArgs();
//        System.out.println("***** args: " + args);
//        for(Object arg : args) {
//        	System.out.println("********** arg: " + arg);
//        }
        
        String verboseCaller = thisJoinPoint.getThis().getClass().getName();
        String caller = verboseCaller.substring(verboseCaller.lastIndexOf(".") + 1);
//        System.out.println("***** caller: " + caller);
        
        String verboseReturnType = ((MethodSignature) thisJoinPoint.getSignature()).getReturnType().getName();
        int index = verboseReturnType.lastIndexOf(".");
        String returnType = (index == -1) ? "" : verboseReturnType.substring(index + 1);
        
        String parsed = caller + "->" + callee + ":" + methodName + "(" + this.printArgs(args) + ") : " + returnType + "\n";
        
        System.out.println("***********************************");
        System.out.print(parsed);
        System.out.println("***********************************");
        
        SequenceDiagram.addParsedCode(parsed);
    }
    
    private String printArgs(Object[] objs){
    	StringBuilder sb = new StringBuilder();
    	
    	for(Object obj : objs) {
    		String verboseArg = obj.getClass().getName();
    		String arg = verboseArg.substring(verboseArg.lastIndexOf(".") + 1);
    		
    		sb.append(arg + ",");
    	}
    	
    	String res = sb.toString();
    	if(res.length() > 0) 
    		res = res.substring(0, res.length() - 1);
    	return res;
    }

}
