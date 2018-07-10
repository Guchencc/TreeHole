package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.DriftingBottle;
import treehole.model.BottleInfo;
import treehole.repository.DriftingBottleRepository;

import java.util.Date;
import java.util.List;
import java.util.Random;

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
        bottle.setPickedUsers("");
        driftingBottleRepository.add(bottle);
    }

    @Override
    public int getRandomBottle(int userId) {
        List<DriftingBottle> bottles= driftingBottleRepository.findUnpickedBottles(userId);
        System.out.println(bottles.size());
        Random random=new Random();
        int index=random.nextInt(bottles.size()*2+1);
        if (index>=bottles.size()){
            System.out.println("啥也没见到");
            return -1;
        }else{
            DriftingBottle bottle=bottles.get(index);
            int bottleId=bottle.getBottleId();
            String pickedUsers=bottle.getPickedUsers();
            bottle.setPickedUsers(pickedUsers+userId+",");
            bottle.setPickCount(bottle.getPickCount()+1);
            driftingBottleRepository.update(bottle);
            System.out.println("捡到"+bottleId);
            return bottleId;
        }
    }
}
