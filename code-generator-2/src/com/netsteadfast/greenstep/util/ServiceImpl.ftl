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
package ${packageName}.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.netsteadfast.greenstep.base.dao.IBaseDAO;
import com.netsteadfast.greenstep.base.service.BaseService;
import ${packageName}.dao.I${headName}DAO;
import com.netsteadfast.greenstep.po.hbm.Tb${headName};
import ${packageName}.service.I${headName}Service;
import ${packageName}.vo.${headName}VO;

@Service("core.service.${headName}Service")
@Scope("prototype")
@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
public class ${headName}ServiceImpl extends BaseService<${headName}VO, Tb${headName}, String> implements I${headName}Service<${headName}VO, Tb${headName}, String> {
	protected Logger logger=Logger.getLogger(${headName}ServiceImpl.class);
	private I${headName}DAO<Tb${headName}, String> ${headNameSmall}DAO;
	
	public ${headName}ServiceImpl() {
		super();
	}

	public I${headName}DAO<Tb${headName}, String> get${headName}DAO() {
		return ${headNameSmall}DAO;
	}

	@Autowired
	@Resource(name="core.dao.${headName}DAO")
	@Required		
	public void set${headName}DAO(
			I${headName}DAO<Tb${headName}, String> ${headNameSmall}DAO) {
		this.${headNameSmall}DAO = ${headNameSmall}DAO;
	}

	@Override
	protected IBaseDAO<Tb${headName}, String> getBaseDataAccessObject() {
		return ${headNameSmall}DAO;
	}

	@Override
	public String getMapperIdPo2Vo() {		
		return MAPPER_ID_PO2VO;
	}

	@Override
	public String getMapperIdVo2Po() {
		return MAPPER_ID_VO2PO;
	}

}
