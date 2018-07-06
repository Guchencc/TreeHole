package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Bulletin;
import treehole.repository.BulletinRepository;

import java.util.List;

@Service
public class BulletinService implements IBulletinService {
    private BulletinRepository bulletinRepository;
    @Autowired
    public BulletinService(BulletinRepository bulletinRepository){
        this.bulletinRepository=bulletinRepository;
    }
    @Override
    public List<Bulletin> getLatestBulletin(int size) {
        List<Bulletin> bulletins=bulletinRepository.findLatest(size);
        return bulletins;
    }
}
