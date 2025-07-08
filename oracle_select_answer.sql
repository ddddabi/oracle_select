-- oracle select 답변 4가지 
SELECT * FROM emp;
--  1. 1981년에 입사한 SALESMAN의 사원명, 직업, 입사일, 급여(내림차순) 출력
SELECT ename, job, TO_CHAR(hiredate,'YYYY-DD-MM'), sal
FROM EMP 
WHERE TO_CHAR(hiredate,'YYYY') = '1981' AND job = upper('SALESMAN')
 order by sal DESC;

-- 2. 입사달이 12월인 사원들의 사원명, 사원번호, 입사일 출력
SELECT ename, empno, TO_CHAR(hiredate,'YYYY-DD-MM') AS 입사일
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12'; 

-- 3. comm이 null or 0 인 사원 중에 급여가 제일 적은 사원의 사원명, 사원번호, 급여 출력(데이터 수정 확인해보기)
SELECT ename, empno, sal 
from emp
WHERE (comm IS NULL OR comm = 0) AND sal = 1500;

-- 4. 부서번호가 20인 사원들의 평균 임금 보다 높이 받는 사원의 사원명, 사원번호, 급여 출력
SELECT ename, empno, sal 
FROM emp
WHERE deptno = 20 AND sal > (SELECT avg(sal) from emp);