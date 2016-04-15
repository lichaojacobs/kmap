package org.andy.kmap.model.entity;

/**
 * Created by li on 2015/10/5.
 */
public class CommonResult {

    private int status;

    private String detail;

    private String redirectUrl;

    public int getStatus() {
        return status;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
