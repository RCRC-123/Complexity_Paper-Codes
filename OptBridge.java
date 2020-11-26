/*
首先以java程序运行，后再输入框输入由matlab得到得“EclipseSR”即可得到YouHuaJiaBian，复制后输入Matlab即可

*/


import java.util.Scanner;

/**
 * "轰炸重要桥"问题：
 * 关键词：DFS、割边、无向连通图、关键桥
 * @author XZP
 *一组测试数据：
6 6 
1 4 
1 3 
4 2
3 2
2 5 
5 6
 */
public class OptBridge {
	public static int index; // 时间戳
	private static int hhh;
	public static void main(String[] args) {
		
		int INF = 99999; // 人为设定的最大值
		int i, j; // 游标
		int v1, v2; // 暂存顶点编号
		int root; // 根节点的编号
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt(); // 顶点数
		int m = sc.nextInt(); // 边的条数
		// 存储边的数组
		int[][] edges = new int[n + 1][n + 1];
		int[] num = new int[n + 1]; // 存储第一遍dfs遍历的时间戳
		int[] low = new int[n + 1]; // 存储最小时间戳的数组
		// 输入边的信息
		for (i = 1; i<= m; i++) {
			v1 = sc.nextInt();
			v2 = sc.nextInt();
			edges[v1][v2] = 1;
			edges[v2][v1] = 1;
		}
		root = 1;
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.print("YouHuaJiaBian=[");
		dfs(1, root, low, num, n, edges);
		System.out.println("]");
		
	}
	/**
	 * 深度优先求“割边”
	 * @param child
	 * @param father
	 * @param low
	 * @param num
	 * @param n
	 * @param edges
	 */
	public static void dfs(int child, int father, int[] low, int[] num, int n, int[][] edges ) {
		int i, j,k,gg;
		index++;
		num[child] = index;
		low[child] = index;
		for (i = 1; i <= n; i++) {
			if (edges[child][i] == 1) {
				if (num[i] == 0) {
					dfs(i, child, low, num, n, edges);
					low[child] = min(low[i], low[child]);
					if (low[i] > num[child]) { // 关键步骤，跟割点差不多，只是这里没有等号，表示不经过父节点，该点就不能达到祖先（包括父节点）那两点组成的边即割边
						gg=1;
						for (k=1;k<=n;k++){
							if (k!=child){
								if (edges[i][k] == 1){
									System.out.println(child + " " + k);
									gg=0;
									break;
								}
							}
							
						}
						if(gg==1){
							for (k=1;k<=n;k++){
								if (k!=i){
									if (edges[k][child] == 1){
										System.out.println(k + " " + i);
										gg=0;
										break;
								}
							}
							
						}
						}
						//System.out.println("割边为 " + child + " - " + i);
						
					}
				} else if (i != father) {
					low[child] = min(low[child], num[i]);
				}
			}
		}
	}
	/**
	 * 求两个数中的较小值
	 * @param a
	 * @param b
	 * @return
	 */
	public static int min(int a, int b) {
		return a > b ? b : a;
	}
}

//***********实践证明：这种存储方式在某些情况下比较优化，但是由于dfs便于找到下一个顶点，最好还是用邻接矩阵*******************
/**
 * 表示一条边的对象
 * @author XZP
 *
 */
class Edge {
	private int v1;
	private int v2;
	public Edge(int v1, int v2) {
		this.v1 = v1;
		this.v2 = v2;
	}
	// getter
	public int getV1() {
		return v1;
	}
	public int getV2() {
		return v2;
	}
}