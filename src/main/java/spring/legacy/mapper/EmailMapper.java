package spring.legacy.mapper;

import org.apache.ibatis.annotations.Param;

public interface EmailMapper {
    int savedVerificationCode(@Param("email") String email, @Param("code") String code);
    int existsEmailCode(@Param("email") String email, @Param("code") String code);
    int expiresAtEmailCode(@Param("email") String email, @Param("code") String code);
}
