package edu.jxufe.boy.dao;

import edu.jxufe.boy.entity.LoginLog;
import org.springframework.stereotype.Repository;


/**
 * Post的DAO类
 *
 */
@Repository
public class LoginLogDao extends BaseDao<LoginLog> {
	public void save(LoginLog loginLog) {
		this.getHibernateTemplate().save(loginLog);
	}

}
