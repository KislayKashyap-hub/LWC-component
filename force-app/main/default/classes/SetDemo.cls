public class SetDemo {
    public static void demo(){
        Set<Integer> intSet = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> cloneSet = new Set<Integer>();
        
        intSet.add(11);
        intSet.add(22);
        intSet.add(33);
        intSet.add(11);
        
        intList.add(44);
        intList.add(55);
        
        intSet.addAll(intList);
        
        System.debug('Set Contains = '+intSet);
        cloneSet =intSet.clone();
        System.debug('Set Contains : '+cloneSet);
        
        System.debug('Element is Available = '+ intSet.contains(515));
        System.debug('Element is Available = '+ intSet.containsAll(intList));
        System.debug('Equal = '+intSet.equals(cloneSet));
        System.debug('Empty = '+intSet.isEmpty());
        intSet.remove(22);
        System.debug('Set Contains = '+intSet);
        
        intSet.RetainALL(intList);
        System.debug('Set Contain = '+intSet);
        System.debug('Size = '+ intSet.size());
    }
}