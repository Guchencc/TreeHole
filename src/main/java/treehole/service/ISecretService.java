package treehole.service;

import treehole.entity.Comment;
import treehole.entity.Secret;
import treehole.model.PageBean;
import treehole.model.SecretInfo;

import java.util.List;

public interface ISecretService {
    List<Secret> getAllSecrets();
    List<Secret> getSecrets(int userId);
    void writeSecret(Secret secret);
    Secret getSecret(int secretId);
    void deleteSecret(int secretId);
    List<SecretInfo> getSecretPage(int startRow, int pageSize);
    void upVote(int secretId);
    void downVote(int secretId);
    PageBean<SecretInfo> getSecretPageByTag(int startRow,int pageSize,String tag);

    PageBean<SecretInfo> getSecretPageBySearch(int pageNum, int pageSize, String content);

    PageBean<SecretInfo> getSecretPageByUserId(int pageNum, int pageSize, int userId);

    PageBean<SecretInfo> getPublicSecretPageByUserId(int pageNum, int pageSize, int userId);

    PageBean<SecretInfo> getSecretsInPageSortByComment(int pageNum, int pageSize);

    PageBean<SecretInfo> getSecretsInPageSortByUpvote(int pageNum, int pageSize);

    PageBean<SecretInfo> getSecretsInPageSortByDownvote(int pageNum, int pageSize);
}
