package xin.yuan.service.impl;

import xin.yuan.dao.ResponseDao;
import xin.yuan.entity.Response;
import xin.yuan.service.ResponseService;

/**
 * @authorknightx
 * @create2019/3/1
 * @since 1.0.0
 */
public class ResponseServiceImpl implements ResponseService {
    ResponseDao responseDao;

    public void setResponseDao(ResponseDao responseDao) {
        this.responseDao = responseDao;
    }

    @Override
    public void addForumMessage(Response responsezz) {
        responseDao.addForumMessage(responsezz);
    }
}
