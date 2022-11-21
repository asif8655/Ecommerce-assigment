package com.application.log;



import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {

	private static Logger logger = Logger.getLogger(LogAspect.class);

	@Pointcut("execution(* com.application.controller..*.*(..))||execution(* com.application.dao..*.*(..))||execution(* com.application.util..*.*(..))||execution(* com.application.repository..*.*(..))")
	public void log() {
		// PointCut expression
	}

	@Around(value = "log()")
	public Object intercept(ProceedingJoinPoint pjp) throws Throwable {

		Signature name = pjp.getSignature();
		try {
			logger.info("started " + name);
			Object obj = pjp.proceed();
			logger.info("finished " + name + " successfully");
			return obj;
		} catch (Throwable t) {
			logger.error(name + " finished with Exception - " + t.getMessage());
			throw t;
		}
	}
}
