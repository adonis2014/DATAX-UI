/*
 * Copyright (C) 2010-2101 Alibaba Group Holding Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.otter.shared.common.model.config;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

import com.alibaba.otter.shared.common.model.config.pipeline.Pipeline;

import net.iharding.modules.meta.model.Dataset;
import net.iharding.modules.meta.model.DatasetPair;

/**
 * 常用的config处理帮助类
 * 
 * @author jianghang 2011-10-20 下午05:28:39
 * @version 4.0.0
 * 
 * 改DataSource等为元数据系统相关对象
 * @author Joe.Zhang
 * 
 */
public class ConfigHelper {

	

	/**
	 * 根据DataMedia id得到对应的DataMedia
	 */
	public static Dataset findDataMedia(Pipeline pipeline, Long id) {
		Assert.notNull(pipeline);
		for (DatasetPair pair : pipeline.getPairs()) {
			if (pair.getSourceDataset().getId().equals(id)) {
				return pair.getSourceDataset();
			} else if (pair.getTargetDataset().getId().equals(id)) {
				return pair.getTargetDataset();
			}
		}
		throw new ConfigException("no such DataMedia , the tableId = " + id);
	}

	/**
	 * 根据NameSpace和Name得到对应的DataMedia.
	 */
	public static Dataset findSourceDataMedia(Pipeline pipeline, String namespace,
			String name) {
		return findSourceDataMedia(pipeline, namespace, name, false);
	}

	/**
	 * 根据NameSpace和Name得到对应的DataMedia
	 */
	public static Dataset findSourceDataMedia(Pipeline pipeline, String namespace,
			String name, boolean notExistReturnNull) {
		for (DatasetPair pair : pipeline.getPairs()) {
			if (isMatch(pair.getSourceDataset(), namespace, name)) {
				return pair.getSourceDataset();
			}
		}

		if (notExistReturnNull) {
			return null;
		} else {
			throw new ConfigException("no such DataMedia , the namespace = " + namespace + " name = " + name);
		}
	}

	/**
	 * 根据DataMedia id得到对应的DataMediaPair
	 */
	public static List<DatasetPair> findDataMediaPairByMediaId(Pipeline pipeline, Long tid) {
		Assert.notNull(pipeline);
		List<DatasetPair> pairs = new ArrayList<DatasetPair>();
		for (DatasetPair pair : pipeline.getPairs()) {
			if (pair.getSourceDataset().getId().equals(tid)) {
				pairs.add(pair);
			} else if (pair.getTargetDataset().getId().equals(tid)) {
				pairs.add(pair);
			}
		}

		return pairs;
	}

	/**
	 * 根据DataMedia id得到对应的DataMediaPair
	 */
	public static DatasetPair findDataMediaPair(Pipeline pipeline, Long pairId) {
		Assert.notNull(pipeline);
		for (DatasetPair pair : pipeline.getPairs()) {
			if (pair.getId().equals(pairId)) {
				return pair;
			}
		}

		throw new ConfigException("no such DataMediaPair , the pairId = " + pairId);
	}

	// ===================== helper method ================

	public static boolean isMatch(Dataset dataMedia, String namespace, String name) {
		boolean isMatch = true;
		if (StringUtils.isEmpty(namespace)) {
			isMatch &= StringUtils.isEmpty(dataMedia.getNameSpace());
		} else {
			isMatch &= dataMedia.getNameSpace().equalsIgnoreCase(namespace);
		}

		if (StringUtils.isEmpty(name)) {
			isMatch &= StringUtils.isEmpty(dataMedia.getDatasetName());
		} else {
			isMatch &= dataMedia.getDatasetName().equalsIgnoreCase(name);
		}
		return isMatch;
	}

	

	public static int indexIgnoreCase(List<String> datas, String value) {
		for (int i = 0; i < datas.size(); i++) {
			String data = datas.get(i);
			if (data.equalsIgnoreCase(value)) {
				return i;
			}

		}

		return -1;
	}

}
