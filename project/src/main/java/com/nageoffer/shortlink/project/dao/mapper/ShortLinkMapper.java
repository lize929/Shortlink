package com.nageoffer.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.nageoffer.shortlink.project.dao.entity.ShortLinkDO;
import com.nageoffer.shortlink.project.dto.req.ShortLinkPageReqDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ShortLinkMapper extends BaseMapper<ShortLinkDO> {

    /**
     * 短链接访问统计自增
     * @param gid
     * @param fullShortUrl
     * @param newPv
     * @param newUv
     * @param newUip
     */
    @Update("update t_link set total_pv = total_pv + #{newPv}, total_uv = total_uv + #{newUv}, total_uip = total_uip + #{newUip} where gid = #{gid} and full_short_url = #{fullShortUrl}")
    void incrementStats(
            @Param("gid") String gid,
            @Param("fullShortUrl") String fullShortUrl,
            @Param("newPv") Integer newPv,
            @Param("newUv") Integer newUv,
            @Param("newUip") Integer newUip
    );

    /**
     * 分页统计短链接pv,uv,uip这些内容
     */
    IPage<ShortLinkDO> pageLink(ShortLinkPageReqDTO requestParam);
}
