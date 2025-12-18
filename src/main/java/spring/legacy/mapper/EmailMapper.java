package spring.legacy.mapper;

import org.apache.ibatis.annotations.Param;

public interface EmailMapper {
    int savedVerificationCode(@Param("email") String email, @Param("code") String code);
}
