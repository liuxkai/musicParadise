package com.train.filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import redis.clients.jedis.Jedis;

// http://localhost:1928/demo-51job/job?method=page&currentPage=1&pageSize=20
@WebFilter("/JsonDataInterface")
public class RedisFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String method = request.getParameter("method");
        if (method != null && method.equals("rankingMusic")) {
            Jedis jedis = new Jedis("localhost", 6379);
            jedis.auth("123456");

            //缓存到redis数据库，下次再访问此页面数据时直接从redis数据库中取数据，目的减轻用户与mysql交互的次数，提高性能
            String key = request.getQueryString();
            String value = jedis.get(key);
            if (value != null) {
                System.out.println("从redis取数据");
                response.getWriter().print(value);
                return;//要取的数据redis里有直接写出后中断
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

	@Override
	public void destroy() {
	}

}
