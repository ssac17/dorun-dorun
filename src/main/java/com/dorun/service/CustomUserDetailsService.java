package com.dorun.service;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.dorun.dto.AccountDto;
import com.dorun.dto.CustomUserDetails;
import com.dorun.mapper.AccountMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final AccountMapper accountMapper;

    public CustomUserDetailsService(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        AccountDto account = accountMapper.findByEmail(email);
        if(account == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + email);
        }
        return new CustomUserDetails(account, AuthorityUtils.createAuthorityList("ROLE_USER"));
    }
}
