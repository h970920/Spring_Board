package com.study.erum.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.study.erum.dto.BoardDTO;
import com.study.erum.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    public int save(BoardDTO boardDTO) {
        return boardRepository.save(boardDTO);
    }
    
    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }
    
    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }
    
    public void delete(Long id) {
    	boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void resetAutoIncrement() {
        boardRepository.resetAutoIncrement();
    }

    int pageLimit = 3;
    int blockLimit = 3;
    public List<BoardDTO> pageList(int page) {
       
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);

        return pagingList;
    }


}

