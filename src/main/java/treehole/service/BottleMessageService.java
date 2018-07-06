package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.BottleMessage;
import treehole.model.BottleDetail;
import treehole.model.BottleMessageInfo;
import treehole.repository.BottleMessageRepository;

import java.util.List;

@Service
public class BottleMessageService implements IBottleMessageService {

    private BottleMessageRepository bottleMessageRepository;
    @Autowired
    public BottleMessageService(BottleMessageRepository bottleMessageRepository) {
        this.bottleMessageRepository=bottleMessageRepository;
    }

    @Override
    public List<BottleMessageInfo> getBottleMessageInfo(int bottleId) {
        return bottleMessageRepository.findBottleMessage(bottleId);
    }

    @Override
    public void leaveMessage(BottleMessage message) {
        bottleMessageRepository.add(message);
    }
}
