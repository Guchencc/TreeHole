package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Comment;
import treehole.entity.Secret;
import treehole.model.PageBean;
import treehole.model.SecretInfo;
import treehole.repository.SecretRepository;

import java.util.Date;
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

    public PageBean<SecretInfo> getSecretsInPage(int pageNum,int pageSize){
        List<Secret> secretList=secretRepository.findAllSecrets();
        int totalRecord=secretList.size();
        PageBean<SecretInfo> pageBean=new PageBean<>(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(secretRepository.findSecretPage(startIndex,pageSize));
        return pageBean;
    }

    @Override
    public void writeSecret(Secret secret) {
        secret.setCreateDate(new Date());
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

    @Override
    public List<SecretInfo> getSecretPage(int startRow, int pageSize) {
        return secretRepository.findSecretPage(startRow,pageSize);
    }

    @Override
    public void upVote(int secretId) {
        secretRepository.upVote(secretId);
    }

    @Override
    public void downVote(int secretId) {
        secretRepository.downVote(secretId);
    }

    @Override
    public PageBean<SecretInfo> getSecretPageByTag(int pageNum,int pageSize,String tag){
        List<Secret> secretList=secretRepository.findSecretWithTag(tag);
        int totalRecord=secretList.size();
        PageBean<SecretInfo> pageBean=new PageBean<>(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(secretRepository.findSecretPageByTag(startIndex,pageSize,tag));
        return pageBean;
    }
}
