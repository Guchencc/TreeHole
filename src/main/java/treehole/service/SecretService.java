package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Comment;
import treehole.entity.Secret;
import treehole.repository.SecretRepository;

import java.util.List;

@Service
public class SecretService implements ISecretService {
    private SecretRepository secretRepository;
    @Autowired
    public SecretService(SecretRepository secretRepository) {
        this.secretRepository=secretRepository;
    }

    @Override
    public List<Secret> getAllSecrets() {
        return secretRepository.findAllSecrets();
    }

    @Override
    public List<Secret> getSecrets(int userId) {
        return secretRepository.findByUserId(userId);
    }

    @Override
    public void writeSecret(Secret secret) {
        secretRepository.add(secret);
    }

    @Override
    public Secret getSecret(int secretId) {
        return secretRepository.findBySecretId(secretId);
    }

    @Override
    public void deleteSecret(int secretId) {
        secretRepository.delete(secretId);
    }
}
