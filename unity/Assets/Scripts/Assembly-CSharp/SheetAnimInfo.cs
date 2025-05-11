using System.Collections.Generic;
using System.Text;
using UnityEngine;

public class SheetAnimInfo
{
	public const float SAMPLE_RATE = 0.025f;

	public const int SAMPLE_FRAME = 40;

	private static SheetAnimInfo INSTANCE;

	private Dictionary<uint, AnimInfo> animList;

	private Dictionary<ushort, ushort> meshList;

	private StringBuilder StringInstance;

	private Material[,] sharedMaterials;

	private Material blobMaterial;

	private AbstractLoader[] sharedMaterialLoaders;

	private AbstractLoader blobMaterialLoader;

	public static SheetAnimInfo Instance
	{
		get
		{
			return null;
		}
	}

	public void DestroyAllMeshes()
	{
	}

	public void CreateMesh(ushort soldierID)
	{
	}

	public static Material GetMaterial(ESheetMeshTexKind kind, int model)
	{
		return null;
	}

	public static Material GetBlobMaterial()
	{
		return null;
	}

	private int SampleStaticMeshToList(GameObject skeletalGo, SkinnedMeshRenderer smr, AnimationClip ac, Dictionary<uint, AnimInfo> list, uint key)
	{
		return 0;
	}

	public AnimInfo GetAnimInfo(ushort heroID, ushort animIdx)
	{
		return null;
	}

	public ushort GetMeshInfo(ushort heroID)
	{
		return 0;
	}

	public bool ContainMesh(ushort modelID)
	{
		return false;
	}
}
