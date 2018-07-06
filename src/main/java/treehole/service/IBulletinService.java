package treehole.service;

import treehole.entity.Bulletin;

import java.util.List;

public interface IBulletinService {
    List<Bulletin> getLatestBulletin(int size);
}
