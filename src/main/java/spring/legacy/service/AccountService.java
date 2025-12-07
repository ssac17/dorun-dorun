package spring.legacy.service;

import org.springframework.stereotype.Service;
import spring.legacy.mapper.AccountMapper;

@Service
public class AccountService {

    private final AccountMapper accountMapper;

    public AccountService(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    public boolean isEmailExists(String email) {
        boolean emailExists = accountMapper.isEmailExists(email);
        return emailExists;
    }
}
