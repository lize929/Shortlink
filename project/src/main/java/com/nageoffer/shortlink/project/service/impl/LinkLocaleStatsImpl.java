package com.nageoffer.shortlink.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nageoffer.shortlink.project.dao.entity.LinkLocaleStatsDO;
import com.nageoffer.shortlink.project.dao.mapper.LinkLocaleStatsMapper;
import com.nageoffer.shortlink.project.service.LinkLocaleStatsService;
import org.springframework.stereotype.Service;


@Service
public class LinkLocaleStatsImpl extends ServiceImpl<LinkLocaleStatsMapper, LinkLocaleStatsDO> implements LinkLocaleStatsService {
}
