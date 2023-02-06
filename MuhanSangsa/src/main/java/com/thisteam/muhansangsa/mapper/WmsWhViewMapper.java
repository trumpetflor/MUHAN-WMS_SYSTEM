package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.WhLocAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

public interface WmsWhViewMapper {

	// 창고 구역 내 위치 목록 조회
	List<Wms_wh_viewVO> selectWhViewList();
	

}
