package treehole.service;

import treehole.entity.BottleMessage;
import treehole.model.BottleDetail;
import treehole.model.BottleMessageInfo;

import java.util.List;

public interface IBottleMessageService {
    List<BottleMessageInfo> getBottleMessageInfo(int bottleId);
    void leaveMessage(BottleMessage message);
}
