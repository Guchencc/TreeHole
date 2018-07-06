package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.DriftingBottle;
import treehole.model.BottleInfo;
import treehole.repository.DriftingBottleRepository;

import java.util.Date;
import java.util.List;

@Service
public class DriftingBottleService implements IDriftingBottleService {
    private DriftingBottleRepository driftingBottleRepository;
    @Autowired
    public DriftingBottleService(DriftingBottleRepository driftingBottleRepository) {
        this.driftingBottleRepository=driftingBottleRepository;
    }

    @Override
    public List<BottleInfo> getThrownBottles(int userId) {
        return driftingBottleRepository.findUserThrownBottle(userId);
    }

    @Override
    public List<BottleInfo> getPickedBottles(int userId) {
        return driftingBottleRepository.findUserPickedBottle(userId);
    }

    @Override
    public BottleInfo getBottleInfo(int bottleId) {
        return driftingBottleRepository.findBottleInfo(bottleId);
    }

    @Override
    public int getBottleFromWish(int wishId){return driftingBottleRepository.findBottleByWishId(wishId);}

    @Override
    public void throwBottleIntoWishSea(int wishId,int userId,boolean isAnonymous) {
        DriftingBottle bottle=new DriftingBottle();
        bottle.setWishId(wishId);
        bottle.setThrowDate(new Date());
        bottle.setUserId(userId);
        bottle.setAnonymous(isAnonymous);
        driftingBottleRepository.add(bottle);
    }
}
