package treehole.model;

import treehole.entity.BottleMessage;

import java.util.List;

public class BottleDetail {
    private BottleInfo bottleInfo;
    private List<BottleMessageInfo> messages;

    public BottleDetail(BottleInfo bottleInfo, List<BottleMessageInfo> messages) {
        this.bottleInfo = bottleInfo;
        this.messages = messages;
    }

    public BottleInfo getBottleInfo() {
        return bottleInfo;
    }

    public void setBottleInfo(BottleInfo bottleInfo) {
        this.bottleInfo = bottleInfo;
    }

    public List<BottleMessageInfo> getMessages() {
        return messages;
    }

    public void setMessages(List<BottleMessageInfo> messages) {
        this.messages = messages;
    }

    @Override
    public String toString() {
        return "BottleDetail{" +
                "bottleInfo=" + bottleInfo +
                ", messages=" + messages +
                '}';
    }
}
