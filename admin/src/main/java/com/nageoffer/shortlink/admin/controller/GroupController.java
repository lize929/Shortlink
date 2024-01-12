package com.nageoffer.shortlink.admin.controller;

import com.nageoffer.shortlink.admin.common.convention.result.Result;
import com.nageoffer.shortlink.admin.common.convention.result.Results;
import com.nageoffer.shortlink.admin.dto.req.ShortLinkGroupSaveReqDTO;
import com.nageoffer.shortlink.admin.dto.req.ShortLinkGroupSortReqDTO;
import com.nageoffer.shortlink.admin.dto.req.ShortlinkGroupUpdateReqDTO;
import com.nageoffer.shortlink.admin.dto.resp.ShortLinkGroupRespDTO;
import com.nageoffer.shortlink.admin.service.GroupService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class GroupController {
    private final GroupService groupService;

    /**
     * 新增短链接
     * @param requestParam
     * @param request
     * @return
     */
    @PostMapping("/api/short-link/admin/v1/group/save")
    public Result<Void> save(@RequestBody ShortLinkGroupSaveReqDTO requestParam, HttpServletRequest request){
        groupService.saveGroup(requestParam.getName(),request.getAttribute("username").toString());
        return Results.success();
    }

    /**
     * 查询短链接分组集合
     * @param request
     * @return
     */
    @GetMapping("/api/short-link/admin/v1/group/search")
    public Result<List<ShortLinkGroupRespDTO>> listGroup(HttpServletRequest request){
        return Results.success(groupService.listGroup(request.getAttribute("username").toString()));
    }

    /**
     * 修改短链接分组名称
     * @param requestParam
     * @return
     */
    @PutMapping("/api/short-link/admin/v1/group/update")
    public Result<String> updateGroup(@RequestBody ShortlinkGroupUpdateReqDTO requestParam,HttpServletRequest request){
        groupService.updateGroup(requestParam,request.getAttribute("username").toString());
        return Results.success("短链接分组名修改成功");
    }

    @DeleteMapping("/api/short-link/admin/v1/group/delete")
    public Result<String> deleteGroup(@RequestParam String gid,HttpServletRequest request){
        groupService.deleteGroup(gid,request.getAttribute("username").toString());
        return Results.success("短链接删除成功");
    }

    @PostMapping("/api/short-link/admin/v1/group/sort")
    public Result<String> sortGroup(@RequestBody List<ShortLinkGroupSortReqDTO> requestParam,HttpServletRequest request){
        groupService.sortGroup(requestParam,request.getAttribute("username").toString());
        return Results.success("短链接顺序重排成功");
    }
}
