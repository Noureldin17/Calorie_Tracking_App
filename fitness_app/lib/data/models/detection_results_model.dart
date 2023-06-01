class DetectionResult {
  List<String>? Food_Names;
  List<int>? Box_Len;
  List<int>? Box_Wid;

  DetectionResult(
      List<String> Food_Names, List<int> Box_Len, List<int> Box_Wid) {
    this.Food_Names = Food_Names;
    this.Box_Len = Box_Len;
    this.Box_Wid = Box_Wid;
  }
}
