using System;

public class Dependency
{
	public Type Type { get; private set; }

	public string Url { get; private set; }

	public Type Type2 { get; private set; }

	public bool IsSuccess { get; set; }

	public Dependency(Type type, string url, Type type2, bool isSuccess = false)
	{
	}
}
