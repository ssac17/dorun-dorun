package spring.legacy.mapper;

import org.apache.ibatis.annotations.Mapper;
import spring.legacy.dto.AccountDto;

@Mapper
public interface AccountMapper {
    boolean isEmailExists(String email);
    int insertAccount(AccountDto accountDto);
}
