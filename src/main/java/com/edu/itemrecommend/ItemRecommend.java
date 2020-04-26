package com.edu.itemrecommend;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;

import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;

import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;

import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;

import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;

import org.apache.mahout.cf.taste.model.DataModel;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

public class ItemRecommend {

	// for문 돌려서 나온는 번호나 출력결과 리스트에 저장시켜서 리스트 번호에 맞는 코스들 보여주기
	public List<String> Recommend(int cosno, String filePath) {
		List<String> recommendList = new ArrayList<>();
		try {

			DataModel dm = new FileDataModel( new File(filePath));

			// ItemSimilarity sim = new LogLikelihoodSimilarity(dm);

			ItemSimilarity sim = new TanimotoCoefficientSimilarity(dm);

			GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(dm, sim);

			long itemId = cosno;

			// 코스번호와 비슷한 아이템 찾기 (5개)
			List<RecommendedItem> recommendations = recommender.mostSimilarItems(itemId, 5);

			for (RecommendedItem recommendation : recommendations) {

				recommendList.add(String.valueOf(recommendation.getItemID()));

			}


		} catch (IOException e) {

			e.printStackTrace();

		} catch (TasteException e) {

			e.printStackTrace();

		}
		return recommendList;

	}

}
