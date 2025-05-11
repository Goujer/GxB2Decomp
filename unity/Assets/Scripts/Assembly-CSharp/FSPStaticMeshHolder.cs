using System.Collections.Generic;
using UnityEngine;

public class FSPStaticMeshHolder : MonoBehaviour
{
	private static FSPStaticMeshHolder _instance;

	private Dictionary<int, Mesh> _meshLinks;

	[SerializeField]
	public int receiverID;

	public static FSPStaticMeshHolder Get()
	{
		return null;
	}

	private void Awake()
	{
	}

	public Mesh GetMesh(int receiverID)
	{
		return null;
	}

	private void LinkMeshes()
	{
	}
}
