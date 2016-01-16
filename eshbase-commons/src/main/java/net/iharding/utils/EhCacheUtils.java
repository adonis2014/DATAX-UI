package net.iharding.utils;

import java.net.URL;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/**
 * ehcache操作工具类
 * 
 * @author zhangxuhui
 * 
 */
public class EhCacheUtils {
	
	private static final String serverPath = "/ehcache.xml";

	private URL url;

	private CacheManager manager;

	private static EhCacheUtils ehCache;

	private EhCacheUtils(String path) {
		url = getClass().getResource(path);
		manager = CacheManager.create(url);
	}

	
	public static EhCacheUtils getServerInstance() {
		if (ehCache == null) {
			ehCache = new EhCacheUtils(serverPath);
		}
		return ehCache;
	}

	public void put(String cacheName, String key, Object value) {
		Cache cache = manager.getCache(cacheName);
		Element element = new Element(key, value);
		cache.put(element);
	}

	public Object get(String cacheName, String key) {
		Cache cache = manager.getCache(cacheName);
		Element element = cache.get(key);
		return element == null ? null : element.getObjectValue();
	}
	
	public boolean isKeyInCache(String cacheName, String key) {
		Cache cache = manager.getCache(cacheName);
		return  cache.isKeyInCache(key);
	}

	public Cache get(String cacheName) {
		return manager.getCache(cacheName);
	}

	public void remove(String cacheName, String key) {
		Cache cache = manager.getCache(cacheName);
		cache.remove(key);
	}

}
