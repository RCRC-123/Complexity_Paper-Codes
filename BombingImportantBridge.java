
/*
����Eclipse��������java�������У����������������matlab�õ��á�EclipseSR�����ɵõ�GeBian

*/

import java.util.Scanner;

/**
 * "��ը��Ҫ��"���⣺
 * �ؼ��ʣ�DFS����ߡ�������ͨͼ���ؼ���
 * @author XZP
 *һ��������ݣ�
6 6 
1 4 
1 3 
4 2
3 2
2 5 
5 6
 */
public class BombingImportantBridge {
	public static int index; // ʱ���
	public static void main(String[] args) {
		
		int INF = 99999; // ��Ϊ�趨�����ֵ
		int i, j; // �α�
		int v1, v2; // �ݴ涥����
		int root; // ���ڵ�ı��
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt(); // ������
		int m = sc.nextInt(); // �ߵ�����
		// �洢�ߵ�����
		int[][] edges = new int[n + 1][n + 1];
		int[] num = new int[n + 1]; // �洢��һ��dfs������ʱ���
		int[] low = new int[n + 1]; // �洢��Сʱ���������
		// ����ߵ���Ϣ
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
		System.out.println("-------------");
		System.out.println("-------------");
		System.out.print("GeBian=[");
		dfs(1, root, low, num, n, edges);
		System.out.println("]");
	}
	/**
	 * ��������󡰸�ߡ�
	 * @param child
	 * @param father
	 * @param low
	 * @param num
	 * @param n
	 * @param edges
	 */
	public static void dfs(int child, int father, int[] low, int[] num, int n, int[][] edges) {
		int i, j;
		index++;
		num[child] = index;
		low[child] = index;
		for (i = 1; i <= n; i++) {
			if (edges[child][i] == 1) {
				if (num[i] == 0) {
					dfs(i, child, low, num, n, edges);
					low[child] = min(low[i], low[child]);
					if (low[i] > num[child]) { // �ؼ����裬������ֻ࣬������û�еȺţ���ʾ���������ڵ㣬�õ�Ͳ��ܴﵽ���ȣ��������ڵ㣩��������ɵı߼����
						//System.out.println("���Ϊ " + child + " - " + i);
						System.out.println(child + " " + i);
						
					}
				} else if (i != father) {
					low[child] = min(low[child], num[i]);
				}
			}
		}
		
	}
	
	
	/**
	 * ���������еĽ�Сֵ
	 * @param a
	 * @param b
	 * @return
	 */
	public static int min(int a, int b) {
		return a > b ? b : a;
	}
}

//***********ʵ��֤�������ִ洢��ʽ��ĳЩ����±Ƚ��Ż�����������dfs�����ҵ���һ�����㣬��û������ڽӾ���*******************
/**
 * ��ʾһ���ߵĶ���
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