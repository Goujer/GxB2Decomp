using UnityEngine;

public class UIBase : MonoBehaviour
{
	public string UIName { get; set; }

	public virtual void OnClick(GameObject go)
	{
	}

	public virtual void OnClickClose()
	{
	}

	public void Close()
	{
	}

	public void Dispose()
	{
	}
}
