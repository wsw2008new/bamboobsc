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
package com.netsteadfast.greenstep.action;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.netsteadfast.greenstep.base.action.BaseSupportAction;
import com.netsteadfast.greenstep.base.action.IBaseAdditionalSupportAction;
import com.netsteadfast.greenstep.base.exception.ControllerException;
import com.netsteadfast.greenstep.base.exception.ServiceException;
import com.netsteadfast.greenstep.base.model.ControllerAuthority;
import com.netsteadfast.greenstep.base.model.ControllerMethodAuthority;
import com.netsteadfast.greenstep.base.model.DefaultResult;
import com.netsteadfast.greenstep.po.hbm.TbSysBpmnResource;
import com.netsteadfast.greenstep.service.ISysBpmnResourceService;
import com.netsteadfast.greenstep.util.MenuSupportUtils;
import com.netsteadfast.greenstep.vo.SysBpmnResourceVO;

@ControllerAuthority(check=true)
@Controller("core.web.controller.SystemBpmnResourceManagementAction")
@Scope
public class SystemBpmnResourceManagementAction extends BaseSupportAction implements IBaseAdditionalSupportAction {
	private static final long serialVersionUID = -8874018162071109964L;
	private ISysBpmnResourceService<SysBpmnResourceVO, TbSysBpmnResource, String> sysBpmnResourceService;
	private SysBpmnResourceVO bpmnResource = new SysBpmnResourceVO();
	
	public SystemBpmnResourceManagementAction() {
		super();
	}
	
	public ISysBpmnResourceService<SysBpmnResourceVO, TbSysBpmnResource, String> getSysBpmnResourceService() {
		return sysBpmnResourceService;
	}

	@Autowired
	@Resource(name="core.service.SysBpmnResourceService")		
	@Required
	public void setSysBpmnResourceService(
			ISysBpmnResourceService<SysBpmnResourceVO, TbSysBpmnResource, String> sysBpmnResourceService) {
		this.sysBpmnResourceService = sysBpmnResourceService;
	}	
	
	private void initData() throws ServiceException, Exception {
		
	}
	
	private void loadResourceData() throws ServiceException, Exception {
		this.transformFields2ValueObject(this.bpmnResource, new String[]{"oid"});
		DefaultResult<SysBpmnResourceVO> result = this.sysBpmnResourceService.findObjectByOid(bpmnResource);
		if (result.getValue()==null) {
			throw new ServiceException(result.getSystemMessage().getValue());
		}
		this.bpmnResource = result.getValue();
	}
	
	/**
	 * core.systemBpmnResourceManagementAction.action
	 * 
	 * @return
	 * @throws Exception
	 */
	@ControllerMethodAuthority(programId="CORE_PROG003D0004Q")
	public String execute() throws Exception {
		try {
			this.initData();
		} catch (ControllerException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (ServiceException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (Exception e) {
			e.printStackTrace();
			this.setPageMessage(e.getMessage().toString());
		}
		return SUCCESS;
	}		
	
	/**
	 * core.systemBpmnResourceCreateAction.action
	 * 
	 * @return
	 * @throws Exception
	 */
	@ControllerMethodAuthority(programId="CORE_PROG003D0004A")	
	public String create() throws Exception {
		try {
			this.initData();
		} catch (ControllerException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (ServiceException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (Exception e) {
			e.printStackTrace();
			this.setPageMessage(e.getMessage().toString());
		}
		return SUCCESS;		
	}
	
	/**
	 * core.systemBpmnResourceEditAction.action
	 * 
	 * @return
	 * @throws Exception
	 */
	@ControllerMethodAuthority(programId="CORE_PROG003D0004E")	
	public String edit() throws Exception {
		String forward = RESULT_SEARCH_NO_DATA;
		try {
			this.initData();
			this.loadResourceData();
			forward = SUCCESS;
		} catch (ControllerException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (ServiceException e) {
			this.setPageMessage(e.getMessage().toString());
		} catch (Exception e) {
			e.printStackTrace();
			this.setPageMessage(e.getMessage().toString());
		}
		return forward;		
	}	

	@Override
	public String getProgramName() {
		try {
			return MenuSupportUtils.getProgramName(this.getProgramId());
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public String getProgramId() {
		return super.getActionMethodProgramId();
	}

	public SysBpmnResourceVO getBpmnResource() {
		return bpmnResource;
	}

	public void setBpmnResource(SysBpmnResourceVO bpmnResource) {
		this.bpmnResource = bpmnResource;
	}

}