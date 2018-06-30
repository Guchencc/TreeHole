package treehole.service;

import treehole.entity.Comment;
import treehole.entity.Secret;

import java.util.List;

public interface ISecretService {
    List<Secret> getAllSecrets();
    List<Secret> getSecrets(int userId);
    void writeSecret(Secret secret);
    Secret getSecret(int secretId);
    void deleteSecret(int secretId);
}
