package kr.co.airbnb.mvc.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.airbnb.mvc.dao.HostDaoInter;
import kr.co.airbnb.mvc.dao.ResDaoInter;
import kr.co.airbnb.mvc.dto.ResVO;

@Component
@Aspect
public class AopAdvice {

	@Autowired
	private HostDaoInter hostDaoInter;
	@Autowired
	private ResDaoInter resDaoInter;

	@Before("execution(* kr.co.airbnb.mvc.controller.HostController.roomDetail(..))")
	public void detailHit(JoinPoint jp) {
		Object[] fd = jp.getArgs();
		ResVO rvo = (ResVO) fd[1];
		hostDaoInter.detailHitUp(rvo.getHno());
	}
	
	@After("execution(* kr.co.airbnb.mvc.controller.ResController.addRes(..))")
	public void saveReserAop(JoinPoint jp) {
		resDaoInter.addReserAop();
	}
}
