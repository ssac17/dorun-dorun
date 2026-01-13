package com.dorun.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.dorun.dto.AccountDto;

@Mapper
public interface AccountMapper {
    boolean isEmailExists(String email);
    int insertAccount(AccountDto accountDto);
    AccountDto findByEmail(String email);
}
