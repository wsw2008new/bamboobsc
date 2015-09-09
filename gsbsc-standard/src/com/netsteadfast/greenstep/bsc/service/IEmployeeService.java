/* 
 * Copyright 2012-2016 bambooCORE, greenstep of copyright Chen Xin Nien
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * -----------------------------------------------------------------------
 * 
 * author: 	Chen Xin Nien
 * contact: chen.xin.nien@gmail.com
 * 
 */
package com.netsteadfast.greenstep.bsc.service;

import java.util.List;
import java.util.Map;

import com.netsteadfast.greenstep.base.exception.ServiceException;
import com.netsteadfast.greenstep.base.model.DefaultResult;
import com.netsteadfast.greenstep.base.model.PageOf;
import com.netsteadfast.greenstep.base.model.QueryResult;
import com.netsteadfast.greenstep.base.model.SearchValue;
import com.netsteadfast.greenstep.base.service.IBaseService;
import com.netsteadfast.greenstep.po.hbm.BbEmployee;
import com.netsteadfast.greenstep.vo.EmployeeVO;

public interface IEmployeeService<T extends java.io.Serializable, E extends java.io.Serializable, PK extends java.io.Serializable> extends IBaseService<T, E, PK> {
	
	public static String MAPPER_ID_PO2VO="employee.po2vo";
	public static String MAPPER_ID_VO2PO="employee.vo2po";
	
	public QueryResult<List<EmployeeVO>> findGridResult(SearchValue searchValue, PageOf pageOf) throws ServiceException, Exception;
	
	public List<String> findForAppendNames(List<String> oids) throws ServiceException, Exception;
	
	public List<String> findForAppendEmployeeOidsByKpiEmpl(String kpiId) throws ServiceException, Exception;
	
	public DefaultResult<List<BbEmployee>> findForInKpiEmpl(String kpiId) throws ServiceException, Exception;
	
	public Map<String, String> findForMap(boolean pleaseSelect) throws ServiceException, Exception;
	
	public List<String> findForAppendEmployeeOidsByReportRoleViewEmpl(String roleId) throws Exception;
	
	public List<String> findForAppendEmployeeOidsByDegreeFeedbackProjectOwner(String projectOid) throws ServiceException, Exception;
	
	public List<String> findForAppendEmployeeOidsByDegreeFeedbackProjectRater(String projectOid) throws ServiceException, Exception;
	
	public BbEmployee findByAccountId(String accountId) throws Exception;
	
	public BbEmployee findByAccountOid(String accountOid) throws Exception;
	
	public Map<String, String> findForMapByDegreeFeedbackProjectOwner(boolean pleaseSelect, String projectOid) throws ServiceException, Exception;
	
}
