package com.rcipe.commons;


import org.aspectj.lang.ProceedingJoinPoint;

public class PojoAspectJ {

	public PojoAspectJ() {
		System.out.println("PojoAspectJ() Default Constactor..............");
	}
	public void work(){
		System.out.println("work() prointcut call/..............");
	}


	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("[AroundLOG] "+getClass()+".invoke() start.....");
		System.out.println("[AroundLOG] 타겟 객체 :"+joinPoint.getTarget().getClass().getName());
		System.out.println("[AroundLOG] 타겟 객체의 호출된 method :"+joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length !=0){
			System.out.println("[AroundLOG] Target Object method 전달 argument : "+joinPoint.getArgs()[0]);
		}
		Object obj=joinPoint.proceed();
		System.out.println("[AroundLOG] 타겍 객체의 호출후 return value:"+obj);
		System.out.println("[AroundLOG] "+getClass()+".invoke() end.....");
		return obj;
	}

}
