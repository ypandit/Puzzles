/**
 * @author Yogesh Pandit
 *
 */
public class TreeSymmetry {

/*
This is symmetrical

      7
     / \
    5   5
   /     \
  9       9
/ \     / \
2   8   8   2 

This is not symmetrical (value difference):
      7
     / \
    5   6
   /     \
  9       9
/ \     / \
2   8   8   2

This is not symmetrical (structural difference)
      7
     / \
    5   5
   /     \
  9       9
/ \     /
2   8   8  

*/
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TreeSymmetry its = new TreeSymmetry();

		// Sample tree using: 7, 5, 5, 9, 9, 2, 8, 8, 2; h = height (for root, h=0)

		// Root; h=0
		Node n = new Node();
		n.setValue(5423);

		// Left child of root; h=1
		Node n1 = new Node();
		n1.setValue(123);
		n.setLeftChild(n1);

		// Right child of root; h=1
		Node n2 = new Node();
		n2.setValue(123);
		n.setRightChild(n2);

		// h=2;
		Node n3 = new Node();
		n3.setValue(765);
		n1.setLeftChild(n3);

		// h=2;
		Node n4 = new Node();
		n4.setValue(765);
		n2.setRightChild(n4);

		// h=3;
		Node n5 = new Node();
		n5.setValue(342);
		n3.setLeftChild(n5);
		Node n6 = new Node();
		n6.setValue(8642);
		n3.setRightChild(n6);

		// h=3;
		Node n7 = new Node();
		n7.setValue(342);
		n4.setRightChild(n7);
		Node n8 = new Node();
		n8.setValue(8642);
		n4.setLeftChild(n8);

		System.out.println(its.isSymmetrical(n));
	}

	/**
	 * @param treeRoot Root node of the Tree
	 * @return True if the tree is symmetrical
	 */
	public boolean isSymmetrical(Node treeRoot) {
		if (treeRoot == null) {
			return true;
		}
		return isSymmetrical(treeRoot.getLeftChild(), treeRoot.getRightChild());
	}

	/**
	 * Recursive method to check if one half of tree is mirror of other half.
	 * For symmetry, if nodes (at the same height) have two child nodes each; 
	 * 		we compare the left child of one with the right child of other & vice-versa
	 * 
	 * @param A Left child of a Node n
	 * @param B Right child of a Node n
	 * @return True if the A and B are equal
	 */
	private boolean isSymmetrical(Node A, Node B) {
		if (A == null && B == null) {
			return true;
		}
		if (A == null || B == null) {
			return false;
		}

		// Check if A and B are equal
		// Check if left of A is equal to right of B
		// Check if right of A is equal to left of B

		// True; if True && True && True; else False
		return A.value == B.value && isSymmetrical(A.getLeftChild(), B.getRightChild())
				&& isSymmetrical(A.getRightChild(), B.getLeftChild());
	}
}

/*
 * Class to hold Node
 */
class Node {
	Node leftChild;
	Node rightChild;
	int value;

	public void setLeftChild(Node left) {
		this.leftChild = left;
	}

	public Node getLeftChild() {
		return this.leftChild;
	}

	public void setRightChild(Node right) {
		this.rightChild = right;
	}

	public Node getRightChild() {
		return this.rightChild;
	}

	public void setValue(int val) {
		this.value = val;
	}

	public int getValue() {
		return this.value;
	}
}
