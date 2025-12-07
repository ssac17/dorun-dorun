package spring.legacy.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {
    boolean isEmailExists(String email);
}
