package electric.dbs;

public class MotifBean
{
  private String sample = "Start value";

  public String getSample() {
    return this.sample;
  }

  public void setSample(String newValue) {
    if (newValue != null)
      this.sample = newValue;
  }
}