package com.example.jpa.board.model;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class BoardTypeInput {

    @NotBlank(message = "게시판 제목은 필수항목입니다.")
    private String name;
}
