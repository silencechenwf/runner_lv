package com.chinasofti.pojo;

/**
 * Created by Administrator on 2017/8/2.
 */
public class Vote {
    private Integer strategyId;
    private Integer enjoy;
    private Integer gone;

    public Vote() {
    }

    public Vote(Integer strategyId, Integer enjoy, Integer gone) {
        this.strategyId = strategyId;
        this.enjoy = enjoy;
        this.gone = gone;
    }

    public Integer getStrategyId() {
        return strategyId;
    }

    public void setStrategyId(Integer strategyId) {
        this.strategyId = strategyId;
    }

    public Integer getEnjoy() {
        return enjoy;
    }

    public void setEnjoy(Integer enjoy) {
        this.enjoy = enjoy;
    }

    public Integer getGone() {
        return gone;
    }

    public void setGone(Integer gone) {
        this.gone = gone;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "strategyId=" + strategyId +
                ", enjoy=" + enjoy +
                ", gone=" + gone +
                '}';
    }
}
